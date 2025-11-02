import { problems } from "../mockdb/problems";


function ProblemTable() {
  return (
    <tbody className="text-[#CACBCB]">
      {problems.map((problem, index) => {
        const difficultyColor =
          problem.difficulty === "Easy"
            ? "text-green-500"
            : problem.difficulty === "Medium"
            ? "text-yellow-500"
            : problem.difficulty === "Hard"
            ? "text-red-500"
            : "text-pink-500";

        console.log(problem, index)
        return (
          <tr
            className={`${index % 2 === 0 ? "bg-gray-500" : ""}`}
            key={problem.id}
          >
            <th>✅</th>
          </tr>
        );
      })}
    </tbody>
  );
}

export default ProblemTable;
