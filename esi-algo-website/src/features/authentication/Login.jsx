import React, { useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import logo from "../../core/assets/logo.png";
import { AiFillEye, AiFillEyeInvisible } from "react-icons/ai";
import { useAuthStore } from "./authStore";
import { PacmanLoader, BarLoader } from "react-spinners";
import { sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../../firebase-config";

function Login() {
  const navigate = useNavigate();
  const { userCredentials, error, dispatchEvent } = useAuthStore();

  const [email, setEmail] = useState("");
  const [emailReset, setEmailReset] = useState("");
  const [open, setOpen] = useState(false);
  const [password, setPassword] = useState("");
  const [isVisible, setVisibility] = useState(false);
  const [isLoading, setLoading] = useState(false);
  const [isLoadingReset, setLoadingReset] = useState(false);

  // to implement later (i need the icons)
  const toggleVisibility = () => {
    setVisibility(!isVisible);
  };

  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    try {
      e.preventDefault();
      setLoadingReset(true);
      await sendPasswordResetEmail(auth, emailReset);
      setMessage(`Password reset link sent to ${emailReset}`);
    } catch (error) {
      setMessage(error.message);
    } finally {
      setLoadingReset(false);
    }
  };

  const handleLogin = async (event) => {
    event.preventDefault();
    setLoading(true);
    await dispatchEvent({
      name: "login",
      email,
      password,
    });
    setLoading(false);
  };

  // this is the cheap way to do it.
  return !userCredentials ? (
    <>
      <div className="flex min-h-full flex-1 flex-col justify-center items-center px-6 py-12 lg:px-8 bg-[#0F1112]">
        {open ? (
          <div>
            <div className="w-screen h-screen bg-white opacity-10 fixed inset-0 "></div>
            <div className="bg-[#edede9] absolute -translate-x-1/2 rounded-md -translate-y-1/2 leading-[1.4] max-w-[600px] min-w-[300px] px-7 py-3.5 left-2/4 top-[50%]">
              <h2 className="font-semibold">Reset Your Password</h2>
              <form onSubmit={handleSubmit} className="mt-4">
                <div className="flex flex-col gap-1 mb-2">
                  <label>Email</label>
                  <input
                    id="email"
                    name="email"
                    value={emailReset}
                    onChange={(event) => setEmailReset(event.target.value)}
                    type="text"
                    autoComplete="email"
                    required
                    className="block w-full rounded-md border-1 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-700 bg-gray-200 sm:text-sm sm:leading-6"
                  />
                </div>
                <div className="flex gap-4 justify-center mt-2 items-center">
                  <button
                    type="submit"
                    className="shrink-0 align-middle bg-gray-400 text-black rounded-md p-2"
                  >
                    {isLoadingReset ? (
                      <BarLoader color="#c05c48" />
                    ) : (
                      "Reset Password"
                    )}
                  </button>
                  {message && <p className="text-xs text-center">{message}</p>}
                </div>
              </form>
              <button
                className="bg-[#c05c48] rounded-md absolute px-[7px] py-[5px] right-2.5 top-2.5"
                onClick={() => setOpen(false)}
              >
                CLOSE
              </button>
            </div>
          </div>
        ) : null}
        <div className="sm:mx-auto sm:w-full sm:max-w-sm">
          <img className="mx-auto h-32 w-auto" src={logo} alt="ESIALGO Logo" />
          <h2 className="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-white">
            Login Into Existing Account
          </h2>
        </div>

        {isLoading ? (
          <div className="mt-10">
            <PacmanLoader color="#EAB308" />
          </div>
        ) : (
          !!error && (
            <div className="mt-10 bg-[#c05c48] w-fit p-4 rounded-md ">
              <h2 className="text-center text-xl font-bold leading-9 tracking-tight text-white">
                {error.title}
              </h2>
              <p className="text-center leading-9 tracking-tight text-white">
                {error.text}
              </p>
            </div>
          )
        )}

        <div className="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
          <form className="space-y-6" onSubmit={handleLogin}>
            <div>
              <label
                htmlFor="email"
                className="block text-sm font-medium leading-6 text-gray-400"
              >
                Username Or Email
              </label>
              <div className="mt-2">
                <input
                  id="email"
                  name="email"
                  type="email"
                  value={email}
                  onChange={(event) => setEmail(event.target.value)}
                  autoComplete="email"
                  required
                  className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-700 bg-gray-100 sm:text-sm sm:leading-6"
                />
              </div>
            </div>

            <div>
              <div className="flex items-center justify-between">
                <label
                  htmlFor="password"
                  className="block text-sm font-medium leading-6 text-gray-400"
                >
                  Password
                </label>
                <div
                  className="text-sm font-semibold text-yellow-500 hover:text-yellow-700 hover:cursor-pointer"
                  onClick={() => setOpen(true)}
                >
                  Forgot password?
                </div>
              </div>
              <div className="relative flex mt-2">
                <input
                  id="password"
                  name="password"
                  value={password}
                  onChange={(event) => setPassword(event.target.value)}
                  type={isVisible ? "text" : "password"}
                  autoComplete="current-password"
                  required
                  className="block w-full rounded-md border-0 py-1.5 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-700 bg-gray-100 sm:text-sm sm:leading-6"
                />
                <label className="absolute right-2 top-1/2 transform -translate-y-1/2">
                  {isVisible ? (
                    <AiFillEye
                      size={25}
                      color="#131517"
                      onClick={toggleVisibility}
                    />
                  ) : (
                    <AiFillEyeInvisible
                      size={25}
                      color="#131517"
                      onClick={toggleVisibility}
                    />
                  )}
                </label>
              </div>
            </div>

            <div>
              <button
                type="submit"
                className="flex w-full justify-center rounded-md bg-yellow-500 px-3 py-2 text-sm font-semibold leading-6 text-black shadow-sm hover:bg-yellow-600 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-700"
              >
                LOGIN
              </button>
            </div>
          </form>

          <p className="mt-10 text-center text-sm text-gray-500">
            Don't have an account?{" "}
            <NavLink
              to="/register"
              className="font-semibold leading-6 text-yellow-500 hover:text-yellow-600"
            >
              Get Started Here
            </NavLink>
          </p>
        </div>
      </div>
    </>
  ) : (
    navigate("/auth")
  );
}

export default Login;

// backup tailwind css for the upper-most forgot password modal: w-screen h-screen fixed inset-0
