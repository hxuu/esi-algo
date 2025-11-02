import React from "react";
import { Route, Routes } from "react-router-dom";
import Home from "./Home";
import Login from "./features/authentication/Login";
import Register from "./features/authentication/Register";
import LiveCode from "./features/code/Live.code";
import ProblemList from "./features/ProblemList/ProblemList";
import Dummy from "./features/authentication/Dummy";

function App() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/auth" element={<Dummy />} />
        <Route path="/problem" element={<LiveCode />} />
        <Route path="/problem-list" element={<ProblemList />} />
      </Routes>
    </>
  );
}

export default App;
