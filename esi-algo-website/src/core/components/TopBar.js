import React from "react";

const TopBar = () => {
  return (
    <nav className="flex h-12 w-full shrink-0 items-center px-5 text-yellow-50">
      <div className="flex w-full justify-between content-between">
        <h1 className="text-2xl text-[#CACBCB]">
          ESI<span className="text-yellow-500">ALGO</span>
        </h1>

        <h1>Live Coding - Problems</h1>
      </div>
    </nav>
  );
};

export default TopBar;
