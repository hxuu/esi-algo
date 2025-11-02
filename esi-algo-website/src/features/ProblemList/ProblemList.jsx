import ProblemTable from "../../core/components/ProblemTable";
import TopBarQ from "../../core/components/TopBarQ";


function ProblemList() {
  return (
    <main className="bg-[#131517] h-screen ">
      <TopBarQ />
      <h1 className="text-4xl text-center mt-10 text-[#CACBCB]">
        Coming to ESI
        <span className="text-yellow-500">ALGO</span> and solving a problem
        yourself are different.
      </h1>

      <div className="overflow-x-auto mx-40 pb-10 mt-10">
        <table className="w-full mx-auto max-w-[1200px]:">
          <thead className="text-[#CACBCB] text-sm uppercase">
            <tr>
              <th className="px-1 w-0 py-3 font-medium" scope="col">Status</th>
              <th className="px-6 w-0 py-3 font-medium" scope="col">Title</th>
              <th className="px-6 w-0 py-3 font-medium" scope="col">Difficulty</th>
              <th className="px-6 w-0 py-3 font-medium" scope="col">Topic</th>
              <th className="px-6 w-0 py-3 font-medium" scope="col">Solution</th>
            </tr>
            <ProblemTable />
          </thead>
        </table>
      </div>
    </main>
  );
}

export default ProblemList;
