import { create } from "zustand";
import { auth } from "../../firebase-config";
import {
  signInWithEmailAndPassword,
  signOut,
  createUserWithEmailAndPassword,
  sendEmailVerification,
} from "firebase/auth";
import { AuthError } from "./errorFlow";

export const useAuthStore = create((set) => ({
  userCredentials: null,
  error: null,
  dispatchEvent: async (event) => {
    switch (event.name) {
      case "login":
        console.log("in case LOGIN");
        const loginResult = await handleLogin(event.email, event.password);
        if (loginResult instanceof AuthError) {
          console.log("Error has occured in login!");
          console.log(`Error: ${loginResult}`);
          set({ error: { title: loginResult.title, text: loginResult.text } });
          setTimeout(() => {
            set({ error: null });
          }, 3000);
        } else {
          set({ userCredentials: loginResult });
        }
        break;
      case "register":
        const registerResult = await handleRegister(
          event.email,
          event.password
        );
        if (registerResult instanceof AuthError) {
          set({ error: registerResult });
        } else {
          set({ userCredentials: registerResult });
        }
        break;
      case "logout":
        const logoutResult = await handleLogout();
        if (logoutResult instanceof AuthError) {
          set({ error: logoutResult });
        } else {
          set({ userCredentials: logoutResult });
        }
        break;
      case "verify":
        await handleVerification(event.user);
        break;
      default:
        console.log("unknow action dispatched");
    }
  },
}));

async function handleLogin(email, password) {
  try {
    console.log("in function HANDLE LOGIN");
    const userCredentials = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );
    console.log("SUCCESS LOGIN");
    console.log("Is user verified?");
    // if (!userCredentials.user.emailVerified) {
    //   return AuthError.fromLogin("auth/email-not-verified");
    // }
    return userCredentials;
  } catch (error) {
    console.log(error);
    return AuthError.from(error);
  }
}

async function handleRegister(email, password) {
  try {
    const userCredentials = await createUserWithEmailAndPassword(
      auth,
      email,
      password
    );
    await sendEmailVerification(userCredentials.user);
    return userCredentials;
  } catch (error) {
    console.log(error.code);
    return AuthError.from(error);
  }
}

async function handleLogout() {
  try {
    await signOut(auth);
    return null;
  } catch (error) {
    console.log(error);
    return AuthError.from(error);
  }
}

async function handleVerification(user) {
  try {
    await sendEmailVerification(user);
  } catch (error) {
    console.log(error);
    // return error.message;
  }
}
