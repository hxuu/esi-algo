import React from "react";
import logo from "../assets/logo.png";
import { Tooltip as ReactTooltip } from "react-tooltip";

function TopBarQ() {
  return (
    <nav className="relative flex h-[50px] w-full shrink-0 px-5 bg-[#282a2c]  items-center">
      <div className="flex justify-between flex-grow items-center">
        <h1 className="flex items-center gap-2 text-[#CACBCB]">
          <img className="mx-auto h-8 w-auto" src={logo} alt="ESIALGO Logo" />
          <div className="flex cursor-pointer gap-2 items-center rounded-sm py-[3px] pl-1 pr-1 hover:bg-[#3c3d3f]">
            {/* ESI<span className="text-yellow-500">ALGO</span> */}
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              width="1em"
              height="1em"
              fill="currentColor"
              class="h-5 w-5 fill-none stroke-current"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21.598 4.8h-13.2m13.2 4.8h-8.4m8.4 9.6h-13.2m-6-12l4.8 4.8-4.8 4.8m19.2-2.4h-8.4"
              ></path>
            </svg>
            <div
              data-tooltip-id="tooltip"
              className="max-w-[170px] truncate text-base"
            >
              Problem List
            </div>
            <ReactTooltip
              id="tooltip"
              place="bottom"
              content="See All Exercises"
            />
          </div>
        </h1>
        <div className="flex gap-2 items-center">
          <a
            className="text-[#CACBCB] text-sm hover:text-yellow-500"
            href="/register"
          >
            Register
          </a>
          <p className="text-[#CACBCB] text-sm font-semibold">Or</p>
          <a
            className="text-[#CACBCB] text-sm hover:text-yellow-500"
            href="/login"
          >
            Login
          </a>
        </div>
      </div>
    </nav>
  );
}

export default TopBarQ;
