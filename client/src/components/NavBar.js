import React from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import { NavWrapper } from './styles/Grids.styles'
import { Logo, NavButton } from './styles/Nav.styles'

const NavBar = ({user, setUser}) => {

    const navigate = useNavigate()
    const handleLogout = () => {
        fetch('/logout', {method: "DELETE"}).then(()=>{setUser(null); navigate('/')})
    }
  
    const loginLink = user ? <NavButton as={NavLink} to={`/users/${user.username}`}><h1>My Characters</h1></NavButton> : <NavButton as={NavLink} to='/login'><h1>Login</h1></NavButton>

    const signupLink = user ? <NavButton as={NavLink} to='/logout' onClick={handleLogout}><h1>Logout</h1></NavButton> : <NavButton as={NavLink} to='/signup'><h1>Signup</h1></NavButton>

    return (
        <NavWrapper>
            <Logo as={NavLink} to='/' ><h1>DnD Before</h1></Logo>
            {loginLink}
            {signupLink}
            <NavButton as={NavLink} to='/races'><h1>Races</h1></NavButton>
            <NavButton as={NavLink} to='/dnd_classes'><h1>Classes</h1></NavButton>
            <Logo as={NavLink} to='/test' style={{"textAlign": "left", "marginLeft": "40px"}} ><h1>Test</h1></Logo>
        </NavWrapper>
  )
}

export default NavBar