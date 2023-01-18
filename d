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



-------------------------------------------------------------------------------------------------

import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import {add, remove} from '../store/cartSlice';
import './Productdetailpage.css';
import { Link } from 'react-router-dom';
// import ProductDetail from './ProductDetail';
// import ActionItem from './ActionItem';

function Productdetailpage() {
    const dispatch = useDispatch();

    let id = window.location.pathname.split("/");
    id = id[2];
    let [ itm, setitm] = useState({});

    const param = useParams();

    let data = async() => {
        const datajson = await fetch('https://content.newtonschool.co/v1/pr/63b6c911af4f30335b4b3b89/products');
        const data = await datajson.json();
        console.log(data[id-1]);
        console.log(data[id-1].title);
        setitm(data[id-1]);
    }

    useEffect(() => {
        if(param?.id) {
            data();
        }
        console.log(param?.id);
        console.log(itm);
    }, [param?.id])
    // return (<div>{itm.title}</div>)   
    
    function handleAdd(product){
        dispatch(add(product))
        //  dispatch({type:'cart/add', payload: product})
        //  console.log(add(product))
     }


    return (
        <>
         {/* <Link to='/Checkout'> */}
        <div className='productdetailpage'>
        <section className='imagesandbutton'>
        <div className='imagediv'>
        <img className='productimage' src={itm.image} alt="" />        
        </div>
        <button className='twobutton addtocart' onClick={()=>handleAdd(itm)}>Add to cart</button>
        <button className='twobutton buynow'>Buy now</button>
        </section>
        <div className='detaildiv'>
            <h3 className='titledetail common'>{itm.title}</h3>
            <div className='ratingandcount common'>
                <div className='rating'>4.6 ★</div>
                <div className='count'>(150)</div>
                {/* <div className='count'>{itm..rating}</div> */}
            </div>
            <div className='pricedetail common'>₹{itm.price}</div>
            <p className='descriptiondetail common'>{itm.description}</p>
        </div>
        </div>
        {/* </Link> */}
        </>

        ) 
}
export default Productdetailpage 


================================================================================================
cart page


import React from 'react'
import { useDispatch, useSelector } from 'react-redux';
import { remove } from '../components/store/cartSlice';
import { Link } from 'react-router-dom';
import './Cart.css';
// import Header from '../layout/Header/Header';

function Cart() {
    const dispatch = useDispatch();
    const products = useSelector((state)=>state.cart)

    function handleRemove(id){
        dispatch(remove(id))
    }
    return (
        <div>
        {/* <div className='Cart' >
            <div className='CartLeft' > 
            <img src='https://bit.ly/3VppGpu' className='CartAdd' alt=''/>
             </div>
        </div> */}
            
            
            <h1 className='cartItems'>Cart Items</h1>

            <div className='productsWrapper'>
               {products.map((product, id)=>{
            
            return(
            <div className= "Products"  key={id}>
            {console.log(id)}
            <img src={product.image} />
           
            <div className='ProductInformation' >
                <h4>{product.title}</h4>
              
                {/* <p>{product.description}</p> */}
                <div className='ProdcutsGroup'  >
                <p className='ProductPrice' >
                <small>$</small>
              <strong >{product.price}</strong>
               </p>
                {/* For the rating*/}
            <div className='ProductRating' >
            <p>{product.rating.rate}/5.0</p>
            </div>
                <p>{product.category}</p>
                </div>
                </div>
                <button className='btn' onClick={()=>handleRemove(product.id)} >Remove</button>
            </div>
            )
        })}
            </div>
        </div>
    )
}

export default Cart;



