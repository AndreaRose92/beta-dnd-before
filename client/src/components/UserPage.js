import { useContext, useEffect, useState } from "react"
import CharacterCard from "./characters/CharacterCard"
import { Logout, NavButton, UserContext } from "./tools/Hooks"
// import { getRequest } from "./tools/FetchTypes"

export const UserPage = () => {

    const {user} = useContext(UserContext)

    const [characters, setCharacters] = useState([])

    useEffect(()=>{setCharacters(user.characters)}, [])

    const renderCards = characters.map(character => <CharacterCard character={character} />)

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            {renderCards}<br/>
            <NavButton path={`/users/${user.username}/characters/new`} text={"Create a Character"} />
            <Logout />
        </div>
    )
}