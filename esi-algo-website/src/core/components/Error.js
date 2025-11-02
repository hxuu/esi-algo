import React from "react";

function Error(props) {
  return (
    <small className="block p-2 bg-[#c05c48] py-0.5 text-xs text-black rounded-b-md ">
      {props.message}
    </small>
  );
}

export default Error;
