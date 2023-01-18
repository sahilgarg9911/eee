import React from 'react';
import { useState } from 'react';
import './Login.css'
// import { Link } from 'react-router-dom'


function Login() {
    const [input, setInput] = useState({
        email: "",
        password: ""
    });

  return (
    <>
        <div className='Login' >
            {/* <Link to="/" > */}
                <img  className='LoginLogo' src='https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Flipkart_logo.svg/1280px-Flipkart_logo.svg.png' alt='' />
            {/* </Link> */}

            {/*Login Form start */}
            <div  className='LoginContainer' >
                <h1>Login</h1>
                <form>
                    <h3>Email</h3>
                    <input name='email' value={input.email} onChange={(e) => setInput({...input, []})} type="email" placeholder='Your Email' required ></input>
                    <h3 >Password</h3>
                    <input type="password" placeholder='Your Password' required  ></input>
                    <button className='LoginButton' >Login</button>
                </form>
                <p>By continuing, you agree to Flipkart's Terms of Use and Privacy Policy.</p>
                <button className='LoginButton' >New to Flipkart? Create an account</button>
            </div>
        </div>
    </>
  )
}

export default Login
