import './style.css'

import { HiUser } from 'react-icons/hi'
const logo = 'https://cdn-icons-png.flaticon.com/512/48/48968.png';

export const Navbar = () => {
    return (
        <div className="navbar">
            <div className='navbar-left'>
                <img src={logo} alt="" className='logo' />
            </div>
            <div className='navbar-center'>
                <ul>
                    <li>Home</li>
                    <li>Rifas</li>
                    <li>Contato</li>
                </ul>
            </div>
            <div className='navbar-right'>
                <HiUser className='userImage'/>
            </div>
        </div>
    )
}