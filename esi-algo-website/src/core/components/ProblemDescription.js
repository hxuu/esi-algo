import React from "react";
import "../styles/Scrollbar.css";

let examples = [
  {
    id: 1,
    inputText: "nums = [2,7,11,15], target = 9",
    outputText: "[0,1]",
    explanation: "Because nums[0] + nums[1] == 9, we return [0, 1].",
  },
  {
    id: 2,
    inputText: "nums = [3,2,4], target = 6",
    outputText: "[1,2]",
    explanation: "Because nums[1] + nums[2] == 6, we return [1, 2].",
  },
  {
    id: 3,
    inputText: " nums = [3,3], target = 6",
    outputText: "[0,1]",
  },
];

function ProblemDescription() {
  return (
    <div className="h-screen bg-[#282a2c] rounded-md ml-2">
      {/* TAB */}
      <div className="flex w-full items-center text-yellow-50 ">
        <div class="border-fill-3 border-gray-400 dark:border-dark-fill-3 flex h-9 w-full items-center justify-between  border-b px-4">
          <div class="flex h-full w-full flex-row gap-6">
            <div class="flex h-full select-none items-center whitespace-nowrap text-xs text-label-1 font-medium shrink-0">
              <span>
                Description of the problem: <strong>Two Sum</strong>
              </span>
              <div class="bg-gray-7 dark:bg-dark-gray-7 absolute -bottom-[1px] h-[2px] w-full"></div>
            </div>
          </div>
        </div>
      </div>
      <div className="flex flex-col h-full overflow-y-auto ">
        <div className="flex flex-1 flex-col">
          <div className="w-full px-5 pt-5">
            <div className="w-full">
              <div class="flex text-gray-100 space-x-4">
                <div class="flex-1">
                  <div class="flex h-full text-gray-100 items-center">
                    <a
                      class="mr-2 text-label-1  text-lg font-medium"
                      href="/problems/two-sum/"
                    >
                      1. Two Sum
                    </a>

                  </div>
                </div>
                <div class="flex items-center">
                  <div class="inline-flex gap-2 text-lg">
                    <div
                      class="popover-wrapper inline-block"
                      data-headlessui-state=""
                    >
                      <div>
                        <div
                          aria-expanded="false"
                          data-headlessui-state=""
                          id="headlessui-popover-button-:r27:"
                        >
                          <div>
                            <div class="px-2 py-1 hover:text-blue-s dark:hover:text-dark-blue-s cursor-pointer rounded transition-colors text-gray-6 dark:text-dark-gray-6 hover:bg-fill-3 dark:hover:bg-dark-fill-3">
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="23"
                                height="16"
                                viewBox="0 0 23 16"
                                fill="currentColor"
                              >
                                <path d="M1.48535 3.08496C1.69271 3.08496 1.87256 3.15902 2.0249 3.30713C2.17725 3.45947 2.25342 3.64144 2.25342 3.85303V7.26807H5.77002V3.85303C5.77002 3.64144 5.84619 3.45947 5.99854 3.30713C6.15088 3.15902 6.33073 3.08496 6.53809 3.08496H6.55713C6.76449 3.08496 6.94434 3.15902 7.09668 3.30713C7.24902 3.45947 7.3252 3.64144 7.3252 3.85303V12.2319C7.3252 12.4478 7.24902 12.6276 7.09668 12.7715C6.94434 12.9238 6.76449 13 6.55713 13H6.53809C6.33073 13 6.15088 12.9238 5.99854 12.7715C5.84619 12.6276 5.77002 12.4478 5.77002 12.2319V8.81689H2.25342V12.2319C2.25342 12.4478 2.17725 12.6276 2.0249 12.7715C1.87256 12.9238 1.69271 13 1.48535 13H1.46631C1.25895 13 1.0791 12.9238 0.926758 12.7715C0.774414 12.6276 0.698242 12.4478 0.698242 12.2319V3.85303C0.698242 3.64144 0.774414 3.45947 0.926758 3.30713C1.0791 3.15902 1.25895 3.08496 1.46631 3.08496H1.48535ZM9.68018 5.6875C9.896 5.6875 10.0758 5.76367 10.2197 5.91602C10.3721 6.06836 10.4482 6.25033 10.4482 6.46191V12.2319C10.4482 12.4478 10.3721 12.6276 10.2197 12.7715C10.0758 12.9238 9.896 13 9.68018 13H9.66748C9.45589 13 9.27393 12.9238 9.12158 12.7715C8.96924 12.6276 8.89307 12.4478 8.89307 12.2319V6.46191C8.89307 6.25033 8.96924 6.06836 9.12158 5.91602C9.27393 5.76367 9.45589 5.6875 9.66748 5.6875H9.68018ZM9.67383 4.8623C9.42839 4.8623 9.21891 4.77555 9.04541 4.60205C8.87191 4.42855 8.78516 4.21908 8.78516 3.97363C8.78516 3.73242 8.87191 3.52507 9.04541 3.35156C9.21891 3.17806 9.42839 3.09131 9.67383 3.09131C9.91504 3.09131 10.1224 3.17806 10.2959 3.35156C10.4736 3.52083 10.5625 3.72819 10.5625 3.97363C10.5625 4.22331 10.4736 4.43278 10.2959 4.60205C10.1224 4.77555 9.91504 4.8623 9.67383 4.8623ZM13.5142 12.2319C13.5142 12.4478 13.438 12.6276 13.2856 12.7715C13.1333 12.9238 12.9535 13 12.7461 13H12.7271C12.5197 13 12.3398 12.9238 12.1875 12.7715C12.0352 12.6276 11.959 12.4478 11.959 12.2319V8.75977C11.959 7.91341 12.2594 7.18978 12.8604 6.58887C13.4613 5.98796 14.1849 5.6875 15.0312 5.6875C15.8734 5.6875 16.5949 5.98796 17.1958 6.58887C17.7967 7.18978 18.0972 7.91341 18.0972 8.75977V12.2319C18.0972 12.4478 18.021 12.6276 17.8687 12.7715C17.7248 12.9238 17.5449 13 17.3291 13H17.3164C17.1048 13 16.9229 12.9238 16.7705 12.7715C16.6182 12.6276 16.542 12.4478 16.542 12.2319V8.75977C16.542 8.34082 16.396 7.98324 16.104 7.68701C15.8078 7.39079 15.4502 7.24268 15.0312 7.24268C14.6081 7.24268 14.2484 7.39079 13.9521 7.68701C13.6602 7.98324 13.5142 8.34082 13.5142 8.75977V12.2319ZM20.1602 3.08496C20.3675 3.08496 20.5474 3.15902 20.6997 3.30713C20.8521 3.45947 20.9282 3.64144 20.9282 3.85303V5.6875H21.8804C22.0877 5.6875 22.2676 5.76367 22.4199 5.91602C22.5723 6.06836 22.6484 6.25033 22.6484 6.46191V6.47461C22.6484 6.69043 22.5723 6.87028 22.4199 7.01416C22.2676 7.1665 22.0877 7.24268 21.8804 7.24268H20.9282V11.0068C20.9282 11.1296 20.9705 11.2332 21.0552 11.3179C21.1398 11.4025 21.2456 11.4448 21.3726 11.4448H21.8804C22.0877 11.4448 22.2676 11.521 22.4199 11.6733C22.5723 11.8257 22.6484 12.0076 22.6484 12.2192V12.2319C22.6484 12.4478 22.5723 12.6276 22.4199 12.7715C22.2676 12.9238 22.0877 13 21.8804 13H21.3726C20.8224 13 20.3506 12.8053 19.957 12.416C19.5677 12.0225 19.373 11.5527 19.373 11.0068V3.85303C19.373 3.64144 19.4492 3.45947 19.6016 3.30713C19.7539 3.15902 19.9338 3.08496 20.1411 3.08496H20.1602Z"></path>
                              </svg>
                            </div>
                            
                          </div>
                        </div>
                      </div>
                    </div>
                    <div
                      class="popover-wrapper inline-block"
                      data-headlessui-state=""
                    >
                      <div>
                        <div
                          aria-expanded="false"
                          data-headlessui-state=""
                          id="headlessui-popover-button-:rn:"
                        >
                          <div>
                            <div class="cursor-pointer rounded p-[3px] text-gray-6 transition-colors dark:text-dark-gray-6 hover:bg-fill-3 dark:hover:bg-dark-fill-3">
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                width="1em"
                                height="1em"
                                fill="currentColor"
                              >
                                <path
                                  fill-rule="evenodd"
                                  d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2zm0 2a8 8 0 100 16 8 8 0 000-16zm-4.998 9.27a1.25 1.25 0 100-2.5 1.25 1.25 0 000 2.5zm6.25-1.25a1.25 1.25 0 11-2.5 0 1.25 1.25 0 012.5 0zm3.75 1.25a1.25 1.25 0 100-2.5 1.25 1.25 0 000 2.5z"
                                  clip-rule="evenodd"
                                ></path>
                              </svg>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                        <p className="text-gray-300">TD N°1 - 1st Semester (DSA) </p>
          </div>
        </div>
        <div
          className="text-gray-100 px-5 pt-5 text-sm whitespace-pre-wrap flex-wrap"
          data-track-load="description_content"
        >
          <p>
            Given an array of integers <code>nums</code>&nbsp;and an integer{" "}
            <code>target</code>, return{" "}
            <em>
              indices of the two numbers such that they add up to{" "}
              <code>target</code>
            </em>
            .
          </p>
          <p>
            You may assume that each input would have{" "}
            <strong>
              <em>exactly</em> one solution
            </strong>
            , and you may not use the <em>same</em> element twice.
          </p>
          <p>You can return the answer in any order.</p>
          <p>&nbsp;</p>
          <div className="example-card h-full">
            <p>
              <strong class="example">Example 1:</strong>
            </p>
            <pre className="example-card">
              <strong className="example-card">Input:</strong> nums =
              [2,7,11,15], target = 9<br></br>
              <strong className="example-card">Output:</strong> [0,1]<br></br>
              <strong className="example-card">Explanation:</strong> Because
              nums[0] + nums[1] == 9, we return [0, 1].
            </pre>
            <p>
              <strong className="example">Example 2:</strong>
            </p>
            <pre className="example-card">
              <strong>Input:</strong> nums = [3,2,4], target = 6 <br></br>
              <strong>Output:</strong> [1,2]
            </pre>
            <p>
              <strong className="example">Example 3:</strong>
            </p>
            <pre>
              <strong>Input:</strong> nums = [3,3], target = 6 <br></br>
              <strong>Output:</strong> [0,1]
            </pre>
            <p>&nbsp;</p>
            <p>
              <strong>Constraints:</strong>
            </p>
            <ul>
              <li>
                <code>
                  2 &lt;= nums.length &lt;= 10<sup>4</sup>
                </code>
              </li>
              <li>
                <code>
                  -10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup>
                </code>
              </li>
              <li>
                <code>
                  -10<sup>9</sup> &lt;= target &lt;= 10<sup>9</sup>
                </code>
              </li>
              <li>
                <strong>Only one valid answer exists.</strong>
              </li>
            </ul>
            <p>&nbsp;</p>
          </div>
          <strong>Follow-up:&nbsp;</strong>Can you come up with an algorithm
          that is less than{" "}
          <code>
            O(n<sup>2</sup>)
          </code>
          <font face="monospace">&nbsp;</font>time complexity?
        </div>
      </div>
    </div>
  );
}

export default ProblemDescription;
