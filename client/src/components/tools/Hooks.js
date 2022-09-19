import { useContext } from "react"
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