import React, { useEffect, useState } from "react";
import { useAuthStore } from "./authStore";
import { onAuthStateChanged, reload } from "firebase/auth";
import { auth } from "../../firebase-config";
import { useNavigate } from "react-router-dom";

function Dummy() {
  const { userCredentials, dispatchEvent } = useAuthStore();
  const [message, setMessage] = useState(null);
  const navigate = useNavigate();

  console.log(userCredentials);
  setInterval(() => {
    console.log("you can see me every 3 seconds");
    checkVerified(userCredentials);
  }, 3000);

  const checkVerified = (user) => {
    user.isVerified ? navigate("/problem") : null;
  };

  useEffect(() => {
    onAuthStateChanged(auth, (userCredentials) => {
      if (!userCredentials) {
        setMessage(
          "No user is available to display. Please login or register again!"
        );
      } else if (userCredentials.emailVerified) {
        setMessage(
          `User is logged in with email - [${
            userCredentials.email
          }] - Verified? (${userCredentials.emailVerified ? "YES" : "NO"})`
        );
        console.log("verified!");
        // navigate("/problem");
      } else {
        setMessage(
          `User email [${userCredentials.emailVerified}] is not verified. Please verify your email to login.`
        );
      }
    });
  }, [userCredentials?.emailVerified]);

  return (
    <div className="flex bg-[#0F1112] h-screen justify-center items-center text-gray-300 text-xl">
      <div className="flex flex-col items-center gap-4">
        {message}
        <button
          className="flex w-fit justify-center rounded-md bg-yellow-500 px-3 py-2 text-sm font-semibold leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700"
          onClick={() =>
            dispatchEvent({ name: "verify", user: userCredentials.user })
          }
        >
          Send Verification Again
        </button>

        <button
          className="flex w-fit justify-center rounded-md bg-yellow-500 px-3 py-2 text-sm font-semibold leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700"
          onClick={() => dispatchEvent({ name: "logout" })}
        >
          Sign Out
        </button>
      </div>
    </div>
  );
}

export default Dummy;
