import { NavLink, useNavigate } from "react-router-dom";
import logo from "../../core/assets/logo.png";
import { useState } from "react";
import { useAuthStore } from "./authStore";
import { AiFillEye, AiFillEyeInvisible } from "react-icons/ai";
import Error from "../../core/components/Error";
import { PacmanLoader } from "react-spinners";

function Register() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmedPassword, setConfirmedPassword] = useState("");

  const [passwordsMatched, setAreMatched] = useState(true);

  const navigate = useNavigate();
  const { userCredentials, error, dispatchEvent } = useAuthStore();

  const [isVisible, setVisibility] = useState(false);
  const [isLoading, setLoading] = useState(false);

  const toggleVisibility = () => {
    setVisibility(!isVisible);
  };

  const handleRegister = async () => {
    const condition = password === confirmedPassword;
    setAreMatched(condition);

    if (condition) {
      setLoading(true);
      console.log("im being executed");
      await dispatchEvent({
        name: "register",
        email,
        password,
      });
      setLoading(false);
    }
  };

  return !userCredentials ? (
    <>
      <div className="flex min-h-full flex-1 flex-col justify-center items-center px-6 py-12 lg:px-8 bg-[#0F1112]">
        <div className="sm:mx-auto sm:w-full sm:max-w-sm">
          <img className="mx-auto h-32 w-auto" src={logo} alt="ESIALGO Logo" />
          <h2 className="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-white">
            Create New Account
          </h2>
        </div>

        {isLoading ? (
          <div className="mt-10">
            <PacmanLoader color="#EAB308" />
          </div>
        ) : (
          !!error && (
            <div className="mt-10 bg-[#c05c48] w-fit p-4 rounded-md ">
              <h2 className="text-center text-xl font-bold leading-9 tracking-tight text-white">
                {error.title}
              </h2>
              <p className="text-center leading-9 tracking-tight text-white">
                {error.text}
              </p>
            </div>
          )
        )}

        <div className="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
          <form
            className="space-y-6"
            onSubmit={(event) => {
              event.preventDefault();
              handleRegister();
            }}
          >
            <div>
              <label
                htmlFor="email"
                className="block text-sm font-medium leading-6 text-gray-400"
              >
                Email
              </label>
              <div className="mt-1">
                <input
                  id="email"
                  name="email"
                  type="email"
                  onChange={(event) => setEmail(event.target.value)}
                  autoComplete="email"
                  required
                  className="block w-full rounded-md border-0 py-1 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-700 bg-gray-200 sm:text-sm sm:leading-6"
                />
              </div>
            </div>

            <div>
              <div className="flex items-center justify-between">
                <label
                  htmlFor="password"
                  className="block text-sm font-medium leading-6 text-gray-400"
                >
                  Password
                </label>
              </div>
              <div className="relative mt-1">
                <input
                  id="password"
                  name="password"
                  value={password}
                  onChange={(event) => setPassword(event.target.value)}
                  type={isVisible ? "text" : "password"}
                  required
                  className="block w-full rounded-md border-0 py-1 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-700 bg-gray-200 sm:text-sm sm:leading-6"
                />
                <label className="absolute right-2 top-1/2 transform -translate-y-1/2">
                  {isVisible ? (
                    <AiFillEye
                      size={20}
                      color="#131517"
                      onClick={toggleVisibility}
                    />
                  ) : (
                    <AiFillEyeInvisible
                      size={20}
                      color="#131517"
                      onClick={toggleVisibility}
                    />
                  )}
                </label>
              </div>
            </div>

            <div>
              <div className="flex items-center justify-between">
                <label
                  htmlFor="password"
                  className="block text-sm font-medium leading-6 text-gray-400"
                >
                  Confirm Password
                </label>
              </div>
              <div className="mt-1">
                <div className="relative">
                  <input
                    id="confirmed-password"
                    name="password"
                    value={confirmedPassword}
                    onChange={(event) =>
                      setConfirmedPassword(event.target.value)
                    }
                    type={isVisible ? "text" : "password"}
                    required
                    className={`block w-full ${
                      !passwordsMatched
                        ? "rounded-t-md border-2 border-[#c05c48] focus:ring-0"
                        : "rounded-md border-0 focus:ring-2 focus:ring-yellow-700"
                    } py-1 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 bg-gray-200 sm:text-sm sm:leading-6`}
                  />
                  <label className="absolute right-2 top-1/2 transform -translate-y-1/2">
                    {isVisible ? (
                      <AiFillEye
                        size={20}
                        color="#131517"
                        onClick={toggleVisibility}
                      />
                    ) : (
                      <AiFillEyeInvisible
                        size={20}
                        color="#131517"
                        onClick={toggleVisibility}
                      />
                    )}
                  </label>
                </div>
                {!passwordsMatched && (
                  <Error message="Password doesn't match" />
                )}
              </div>
            </div>

            <div>
              <button
                type="submit"
                className="flex w-full justify-center rounded-md bg-yellow-500 px-3 py-2 text-sm font-semibold leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700"
              >
                REGISTER
              </button>
            </div>
          </form>

          <p className="mt-10 text-center text-sm text-gray-500">
            Already have an account?{" "}
            <NavLink
              to={"/login"}
              className="font-semibold leading-6 text-yellow-500 hover:text-yellow-600"
            >
              Login Here
            </NavLink>
          </p>
        </div>
      </div>
    </>
  ) : (
    navigate("/auth")
  );
}

export default Register;
