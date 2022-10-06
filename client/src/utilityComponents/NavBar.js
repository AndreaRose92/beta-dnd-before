import React from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import { NavWrapper, Logo, NavButton } from '../styles'

export const NavBar = ({user, setUser}) => {

    const navigate = useNavigate()
    const handleLogout = () => {
        fetch('/logout', {method: "DELETE"}).then(()=>{setUser(null); navigate('/')})
    }
  
    const loginLink = user ? <NavButton as={NavLink} to={`/users/${user.username}`}><h1>My Characters</h1></NavButton> : <NavButton as={NavLink} to='/login'><h1>Login</h1></NavButton>

    const signupLink = user ? <NavButton as={NavLink} to='/logout' onClick={handleLogout}><h1>Logout</h1></NavButton> : <NavButton as={NavLink} to='/signup'><h1>Signup</h1></NavButton>

    return (
        <NavWrapper>
            <Logo as={NavLink} to='/'><h1>DnD Before</h1></Logo>
            {loginLink}
            {signupLink}
            <NavButton as={NavLink} to='/races'><h1>Races</h1></NavButton>
            <NavButton as={NavLink} to='/classes'><h1>Classes</h1></NavButton>
            {user ? <NavButton as={NavLink} to='/new_character/basics'><h1>New Character</h1></NavButton> : null}
        </NavWrapper>
  )
}