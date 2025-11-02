import os
import shutil
import subprocess
from fastapi import APIRouter, HTTPException
from .. import schemas

router = APIRouter(
    tags=["Code Handler"],
    prefix="/code",
)


def sanitize_code(code: str) -> str:
    # Implement code sanitization here (e.g., using bleach) to prevent code injection
    return code


def run_pascal_code(formatted_code: str, input_: str) -> str:
    # Save the formatted code to a temporary file
    with open("code.pas", "w") as file:
        file.write(formatted_code)

    try:
        # Run the Pascal compiler and execute the compiled program, capturing its output
        compilation_result = subprocess.run(
            ["fpc", "code.pas"], capture_output=True, text=True)
        if compilation_result.returncode != 0:
            return compilation_result.stdout.strip()

        result = subprocess.run(
            ["./code"],
            input=input_,
            capture_output=True,
            text=True,
            timeout=5  # Set an appropriate timeout for code execution
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        raise HTTPException(status_code=500, detail="Compilation error")
    except subprocess.TimeoutExpired:
        raise HTTPException(status_code=500, detail="Code execution timed out")
    finally:
        # Clean up the temporary files after execution
        os.remove("code.pas")
        if os.path.exists("code"):
            os.remove("code")
        shutil.rmtree("__pycache__", ignore_errors=True)


@router.post("/handle-sumbit")
async def handle_code_submission(request: schemas.LiveCode):
    inputs = request.input_.split("\n")
    expected_outputs = request.output.split("\n")
    starter_code = sanitize_code(request.code)

    try:
        test_cases_passed = 0
        final_result = ""

        for input_, expected_output in zip(inputs, expected_outputs):
            actual_input = input_.split(",")
            formatted_code = starter_code.format(*actual_input)
            final_result = run_pascal_code(formatted_code, input_)

            if final_result == expected_output:
                test_cases_passed += 1
            else:
                break

        if test_cases_passed == len(inputs):
            return {
                "message": "All test cases passed!",
                "status": "success",
                "stdout": final_result,
                "stdin": input_,
            }
        else:
            return {
                "message": "Some test cases failed!",
                "status": "failure",
                "stdin": input_,
                "stdout": final_result,
            }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
