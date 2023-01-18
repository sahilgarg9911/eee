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






-------------------------------------------------------------------------





header page with login button 


// import { AppBar, Toolbar } from '@mui/material';
import React from 'react'
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';
import '../headerstyle/Header.css';
import Search from './Search';
import Custombuttons from './Custombuttons';


const Header = () => {
  const products = useSelector((state)=> state.cart)
  const logoUrl = 'https://image.pitchbook.com/IIZvz8HxGpxmd4nnI5Irsnm0JAx1666857561209_200x200';
  return (
    <div className='headerMainDiv'>
      <Link to="/" className='headerLink' >
        <img className='logoimage' src={logoUrl} alt="logo" />
        </Link>
        <Search />
        {/* <Custombuttons/> */}
        <section className='custombuttonssection'>
      {/* <div className='headerNavbar' > */}
      <Link to="/Login" className='headerLink' >
      <button className='loginbutton'>Login</button>
      </Link>
        
        <p className='more-container'>More <img className='dropdownicon' src="https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_arrow_drop_down_48px-512.png" alt="dropdown" /> </p>
        <NavLink to="/Cart" className='headerLink' >
        <p className='cart-container'><img className='carticon' src="https://cdn.icon-icons.com/icons2/1369/PNG/512/-shopping-cart_90604.png" alt="" />Cart : {products.length}</p>
        </NavLink>
        {/* <p className='cart-container'><img className='carticon' src="https://cdn.icon-icons.com/icons2/1369/PNG/512/-shopping-cart_90604.png" alt="" />Cart:{products.length}</p> */}
      {/* </div> */}
    </section>
    </div>

  )
}
export default Header;
