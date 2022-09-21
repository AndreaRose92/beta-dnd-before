import { useContext, useEffect } from "react"
import { useNavigate } from "react-router-dom"
import React, { useState } from "react"

export const UserContext = React.createContext()

export const UserProvider = ({children}) => {
    const [user, setUser] = useState(null)
    return (
        <UserContext.Provider value={{user, setUser}}>
            {children}
        </UserContext.Provider>
    )
}

export const CharacterContext = React.createContext()

export const CharacterProvider = ({children}) => {
    const [character, setCharacter] = useState({
        name: '',
        user_id: 0,
        dnd_class_id: 0,
        race_id: 0,
        strength: 0,
        dexterity: 0,
        constitution: 0,
        intelligence: 0,
        wisdom: 0,
        charisma: 0,
        hp: 0,
        current_hp: 0
    })
    return (
        <CharacterContext.Provider value={{character, setCharacter}}>
            {children}
        </CharacterContext.Provider>
    )
}


export const NavButton = ({path="/", text="back"}) => {
    const navigate = useNavigate()
    return (
        <button onClick={()=> navigate(path)}>{text}</button>
    )
}

export const Logout = () => {
    const {setUser} = useContext(UserContext)
    const navigate = useNavigate()
    const handleLogout = () => {
        fetch('/logout', {method: "DELETE"}).then(()=>{setUser(null); navigate('/')})
    }
    return (
        <button onClick={handleLogout}>Logout</button>
    )
}

export const AuthRoutes = ({children, setUser}) => {
    const navigate = useNavigate()

    useEffect(()=>{
        fetch('/me').then(r=>{if(r.ok){r.json().then(user=>setUser(user))}else{navigate('/')}})
    })

    return (
        <>
            {children}
        </>
    )
}

export const capitalize = string => {
    return (string.charAt(0).toUpperCase()+string.slice(1))
}