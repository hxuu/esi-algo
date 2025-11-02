import React, { useEffect } from "react";
import Split from "react-split";
import TopBarQ from "../../core/components/TopBarQ";
import ProblemDescription from "../../core/components/ProblemDescription";
import Workspace from "../../core/components/Workspace";

function LiveCode() {
  useEffect(() => {
    // Disable body scrolling when the component mounts
    document.body.style.overflow = "hidden";

    return () => {
      // Re-enable body scrolling when the component unmounts
      document.body.style.overflow = "auto";
    };
  }, []);

  return (
    <div className="bg-[#0F1112]">
      <TopBarQ />
      <Split className="flex split mt-2" minSize={0}>
        <ProblemDescription />
        <Workspace />
      </Split>
    </div>
  );
}

export default LiveCode;
