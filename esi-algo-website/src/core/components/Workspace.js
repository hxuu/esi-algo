import React from "react";
import CodeMirror from "@uiw/react-codemirror";
import Split from "react-split";
import "../styles/Scrollbar.css";
import { langs } from "@uiw/codemirror-extensions-langs";
import { javascript } from "@codemirror/lang-javascript";
import { vscodeDark } from "@uiw/codemirror-theme-vscode";
import PreferenceNav from "./PreferenceNav";
import { FiCpu } from "react-icons/fi";
import {
  AiOutlineSetting,
  AiOutlineArrowUp,
  AiOutlineArrowDown,
} from "react-icons/ai";

import Footer from "./Footer";
import { python } from "@codemirror/lang-python";

function Workspace() {
  const [value, setValue] = React.useState(
    "class Solution:\n\tdef twoSum(self, nums: List[int], target: int) -> List[int]:\n\t\t# write your code here..."
  );
  const onChange = React.useCallback((val, viewUpdate) => {
    console.log("val:", val);
    setValue(val);
  }, []);
  return (
    <div className="rounded-t-md mr-2">
      <div className="flex w-full bg-[#282a2c] rounded-t-md border-gray-400 h-9  border-b items-center justify-center text-yellow-50 ">
        <div className="flex items-center justify-between  bg-dark-layer-2 roun w-full ">
          <div className="flex items-center ">
            <button className="flex cursor-pointer items-center rounded focus:outline-none bg-dark-fill-3 text-dark-label-2 hover:bg-dark-fill-2  px-2 py-1.5 font-medium">
              <div className="flex items-center px-1">
                <div className="text-xs flex items-center gap-2 hover:bg-gray-600 px-2 py-1 rounded-sm dark:text-dark-label-2">
                  Python <FiCpu />
                </div>
              </div>
            </button>
          </div>

          <div className="flex items-center mr-1">
            <button className="">
              <div className="h-4 w-auto mr-2 mb-1 text-dark-gray-6 font-bold text-lg">
                <AiOutlineSetting />
              </div>
              {/* <div className="preferenceBtn-tooltip">Settings</div> */}
            </button>
          </div>
        </div>
      </div>
      {/* <Split
        className="h-[calc(100vh-94px)]"
        direction="vertical"
        sizes={[60, 40]}
        minSize={60}
      > */}
      <div className=" flex flex-col h-screen w-full justify-start">
        <div className="w-full">
          <CodeMirror
            value={value}
            className="whitespace-pre-wrap break-words mb-2"
            height="77vh"
            theme={vscodeDark}
            extensions={[python()]}
            onChange={onChange}
          />
        </div>
        {/* </Split> */}
        <div className="">
          <Footer />
        </div>
      </div>
    </div>
  );
}

export default Workspace;
