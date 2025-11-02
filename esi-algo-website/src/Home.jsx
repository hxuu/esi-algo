import React from "react";
import './core/styles/Home.css';
import Navigation from "./core/components/Navigation";
import Welcome from "./core/components/Welcome";


function Home() {
  return (
    <div className="flex flex-col h-full">
      <Navigation />
      <Welcome />
      <div className="overlay"></div>
    </div>
  );
}

export default Home;
