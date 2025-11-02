import { NavLink } from "react-router-dom";
import { BiLogInCircle } from "react-icons/bi";
import { AiOutlinePlus } from "react-icons/ai";

const Navigation = () => {
  return (
    <nav className="flex justify-around items-center mt-8">
      <div className="flex flex-col w-fit">
        <h1 className="text-4xl text-[#CACBCB]">
          ESI<span className="text-yellow-500">ALGO</span>
        </h1>
        <a
          className="text-[#CACBCB] text-sm hover:cursor-pointer"
          href="https://github.com/4nskarts"
          target="_blank"
          rel="noopener noreferrer"
        >
          Made By: Anas Mokhtari
        </a>
      </div>
      <div className="flex gap-4">
        <NavLink to={"/login"}>
          <button className="flex justify-between items-center gap-2 bg-[#CACBCB] rounded-md h-fit py-3 px-4  leading-6 text-black shadow-sm hover:bg-gray-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-500 ">
            <BiLogInCircle /> Login
          </button>
        </NavLink>
        <NavLink to={"/register"}>
          <button className="flex justify-between items-center gap-2 bg-yellow-500 px-4 rounded-md h-fit py-3  leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700 ">
            <AiOutlinePlus /> Register
          </button>
        </NavLink>
      </div>
    </nav>
  );
};

export default Navigation;
