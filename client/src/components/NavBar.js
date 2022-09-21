import React from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import { NavWrapper } from './styles/Grids.styles'
import { NavButton } from './styles/Nav.styles'

const NavBar = ({user, setUser}) => {

    const navigate = useNavigate()
    const handleLogout = () => {
        fetch('/logout', {method: "DELETE"}).then(()=>{setUser(null); navigate('/')})
    }
  
    const loginLink = user ? <NavButton as={NavLink} to={`/users/${user.username}`}>My Characters</NavButton> : <NavButton as={NavLink} to='/login'>Login</NavButton>

    const signupLink = user ? <NavButton as={NavLink} to='/logout' onClick={handleLogout}>Logout</NavButton> : <NavButton as={NavLink} to='/signup'>Signup</NavButton>

    return (
        <NavWrapper>
            <h1 style={{"textAlign": "right", "marginRight": "20px"}}>DnD Before</h1>
            {loginLink}
            {signupLink}
            <NavButton as={NavLink} to='/races'>Races</NavButton>
            <NavButton as={NavLink} to='/dnd_classes'>Classes</NavButton>
        </NavWrapper>
  )
}

export default NavBar