import React from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import { NavWrapper, DropButton, DropDown, DropDownContent, Logo, NavButton } from '../styles'
import { classes, races } from '../hookComponents'

export const NavBar = ({user, setUser}) => {

    const navigate = useNavigate()
    const handleLogout = () => {
        fetch('/logout', {method: "DELETE"}).then(()=>{setUser(null); navigate('/')})
    }
  
    const loginLink = user ? <NavButton as={NavLink} to={`/users/${user.username}`}><h1>My Characters</h1></NavButton> : <NavButton as={NavLink} to='/login'><h1>Login</h1></NavButton>

    const signupLink = user ? <NavButton as={NavLink} to='/logout' onClick={handleLogout}><h1>Logout</h1></NavButton> : <NavButton as={NavLink} to='/signup'><h1>Signup</h1></NavButton>

    const raceLinks = races.map(race => <DropButton key={race} as={NavLink} to={`/races/${race.toLowerCase()}`}>{race}</DropButton>)
    const classLinks = classes.map(c => <DropButton key={c} as={NavLink} to={`/classes/${c.toLowerCase()}`}>{c}</DropButton>)

    return (
        <NavWrapper>
            <Logo as={NavLink} to='/' ><h1>DnD Before</h1></Logo>
            {loginLink}
            {signupLink}
            <DropDown>
                <h1>Races</h1>
                <DropDownContent>
                    {raceLinks}
                </DropDownContent>
            </DropDown>
            <DropDown>
                <h1>Classes</h1>
                <DropDownContent>
                    {classLinks}
                </DropDownContent>
            </DropDown>
            {user ? <NavButton as={NavLink} to='/new_character/basic'><h1>New Character</h1></NavButton> : null}
        </NavWrapper>
  )
}