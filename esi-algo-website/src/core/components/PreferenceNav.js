import React from "react";


function PreferenceNav() {
  return (
    <div className="flex items-center justify-between bg-dark-layer-2 h-11 w-full border-b-2 ">
      <div className="flex items-center text-white">
        <button className="flex cursor-pointer ml-2 items-center rounded focus:outline-none bg-slate-500 text-dark-label-2 hover:bg-slate-600  px-2 py-1.5 font-medium">
          <div className="flex items-center px-1">
            <div className="text-xs text-label-2 dark:text-dark-label-2">
              Python
            </div>
          </div>
        </button>
      </div>

      <div className="flex items-center m-2">
        <button
          className="relative rounded px-3 py-1.5 font-medium items-center transition-all focus:outline-none inline-flex  ml-auto p-1 mr-2 hover:bg-dark-fill-3 group"
          
        >
          <div className="w-fit text-yellow-50 text-xs">
           Settings
          </div>
          
        </button>

      </div>
      {/* {settings.settingsModalIsOpen && (
        <SettingsModal settings={settings} setSettings={setSettings} />
      )} */}
    </div>
  );
}

export default PreferenceNav;
