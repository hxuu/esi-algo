import React from "react";
import { AiOutlineArrowUp, AiOutlineArrowDown } from "react-icons/ai";

function Footer() {
  const handleSubmit = () => {};

  return (
    <div class="px-4 my-[5px] flex w-full py-2 rounded-md bg-[#282a2c]">
      <div class="flex flex-1 flex-nowrap items-center gap-2">
        <button
          data-e2e-locator="console-console-button"
          className="px-3 py-1.5 bg-gray-500 hover:bg-gray-700 font-medium items-center transition-all inline-flex bg-dark-fill-3 text-sm hover:bg-dark-fill-2 text-dark-label-2 rounded-lg pl-3 pr-2"
        >
          Console
          <div class="ml-1 transform transition">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              width="1em"
              height="1em"
              fill="currentColor"
              className="text-gray-6 dark:text-dark-gray-6 group-hover:text-gray-7 dark:group-hover:text-dark-gray-7 h-4 w-4 text-[20px]"
            >
              <path
                fill-rule="evenodd"
                d="M16.293 14.707a1 1 0 001.414-1.414l-5-5a1 1 0 00-1.414 0l-5 5a1 1 0 101.414 1.414L12 10.414l4.293 4.293z"
                clip-rule="evenodd"
              ></path>
            </svg>
          </div>
        </button>
      </div>
      <div class="flex flex-row items-center justify-center">
        <img
          src="/_next/static/images/dark-judging-723b3c3e728a574bc2a2d4b89a10d4d7.gif"
          alt="Judging..."
          class="mr-2 h-8 w-8 hidden"
        ></img>
        <img
          src="/_next/static/images/dark-pending-f313d6fe32951fb6b4d48ad3ee4f3821.gif"
          alt="Pending..."
          class="mr-2 h-8 w-8 hidden"
        ></img>
      </div>
      <div class="relative ml-auto flex items-center gap-3">
        <button class="rounded font-medium items-center whitespace-nowrap focus:outline-none inline-flex p-1.5 opacity-50 hover:bg-fill-3 dark:hover:bg-dark-fill-3 cursor-pointer">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            width="1em"
            height="1em"
            fill="white"
            classClass="text-text-secondary dark:text-text-secondary w-4 h-4"
          >
            <path
              fill-rule="evenodd"
              d="M12 4a2 2 0 00-2 2h4a2 2 0 00-2-2zm3.924 2.384A.997.997 0 0016 6a4 4 0 00-8 0c0 .136.027.265.076.384a5.015 5.015 0 00-1.97 1.48A3.002 3.002 0 014 5a1 1 0 00-2 0 5.001 5.001 0 003.182 4.659A5.005 5.005 0 005 11v1H3a1 1 0 100 2h2v1c0 .425.038.84.11 1.244A5 5 0 002 20.874a1 1 0 102 0c0-1.208.715-2.251 1.746-2.726A7 7 0 0012 22a7 7 0 006.254-3.852A3.002 3.002 0 0120 20.874a1 1 0 102 0 5 5 0 00-3.11-4.63c.072-.404.11-.82.11-1.244v-1h2a1 1 0 100-2h-2v-1c0-.465-.063-.914-.182-1.341A5.001 5.001 0 0022 5a1 1 0 10-2 0 3.002 3.002 0 01-2.105 2.865 5.015 5.015 0 00-1.971-1.481zM17 11a3 3 0 00-3-3h-1v11.9a5.002 5.002 0 004-4.9v-4zm-6 8.9V8h-1a3 3 0 00-3 3v4a5.002 5.002 0 004 4.9z"
              clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <button
          data-e2e-locator="console-run-button"
          class="px-3 py-1.5 bg-gray-500 hover:bg-gray-700 text-sm font-medium items-center whitespace-nowrap transition-all focus:outline-none inline-flex bg-dark-fill-3  hover:bg-dark-fill-2 text-dark-label-2 rounded-lg"
        >
          Run
        </button>
        <button
          data-e2e-locator="console-submit-button"
          class="px-3 py-1.5 bg-green-600 hover:bg-green-800 font-medium items-center transition-all focus:outline-none inline-flex text-sm text-white bg-dark-green-s hover:bg-green-3 rounded-lg"
        >
          Submit
        </button>
      </div>
    </div>
  );
}

export default Footer;
