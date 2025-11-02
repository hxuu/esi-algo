import React from "react";
import { NavLink } from "react-router-dom";
import { BsFillDoorOpenFill } from "react-icons/bs";

function Welcome() {
  return (
    <div className="flex items-center justify-center h-screen">
      <main className="flex flex-col items-center justify-center grow">
        <div className="flex flex-col items-center gap-10">
          <div className="text-center">
            <p className="text-7xl font-bold text-[#CACBCB]">
              WELCOME TO ESI<span className="text-yellow-500">ALGO</span>
            </p>
          </div>

          <p className="text-4xl text-[#CACBCB] w-3/4 text-center">
            Master Data Structures & Algorithms Concepts and Ace Your DSA Exam!
          </p>
          <p className="text-2xl text-[#CACBCB] w-2/3 text-center font-light">
            Our platform is a dedicated clone of the popular coding website
            LeetCode.
          </p>
          <div className="flex flex-col justify-center items-center gap-2">
            <NavLink to={"/register"}>
              <button className="flex items-center gap-4 bg-yellow-500 px-8 rounded-md w-full justify-center  leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700 h-fit py-4 text-2xl">
                <BsFillDoorOpenFill /> Get Started
              </button>
            </NavLink>
            <p className="text-[#CACBCB] text-center max-w-[250px] font-light">
              Discover why DSA is meant to be coded on PC not paper
            </p>
          </div>
        </div>
      </main>
    </div>
  );
}

export default Welcome;
