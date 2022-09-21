import { useContext, useEffect, useState } from "react"
import CharacterCard from "./characters/CharacterCard"
import NewCharacter from "./characters/NewCharacter"
import { NotFound } from "./NotFound"
import { Logout, NavButton, UserContext } from "./tools/Hooks"

export const UserPage = () => {

    const {user, setUser} = useContext(UserContext)
    const [characters, setCharacters] = useState([])

    useEffect(()=>{
        fetch('/me')
            .then(r=>{
                if (r.ok) {
                    r.json().then(me=>{setUser(me); setCharacters(me.characters)})
                } else {
                    r.json().then(errors=>console.log(errors))
                }
            })
    }, [setUser])


    const deleteCharacter = char => {setCharacters(characters => characters.filter(c => c.id !== char.id))}

    const renderCards = characters.map(character => <CharacterCard key={character.id} character={character} deleteCharacter={deleteCharacter} />)

    if (!user) {
        return <NotFound />
    }

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            {renderCards}<br/>
            <NavButton path={`/users/${user.username}/characters/new`} text={"Create a Character"}><NewCharacter setCharacters={setCharacters} /></NavButton>
            <Logout />
        </div>
    )
}