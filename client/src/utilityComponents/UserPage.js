import { ErrorContext, UserContext } from "../hookComponents"
import { CharacterCard } from "../characterComponents"
import { useContext, useEffect, useState } from "react"
import { CardWrapper, Error, UserWrapper } from "../styles"

export const UserPage = () => {

    const {user} = useContext(UserContext)
    const {errors, setErrors} = useContext(ErrorContext)
    const [characters, setCharacters] = useState([])

    useEffect(()=>{
        fetch(`/characters`).then(r=>{
            if (r.ok) {
                r.json().then(data=>setCharacters(data))
            } else {
                r.json().then(errors=>setErrors([errors]))
            }
        })
    }, [setErrors])

    const deleteCharacter = e => {
        fetch(`/characters/${e.target.value}`, {method: "DELETE"})
        setCharacters(characters.filter(char => char.id !== e.target.value))
    }

    const renderCards = characters.map(character => <CharacterCard key={character.id} character={character} deleteCharacter={deleteCharacter} />)

    if (!user) {
        return (
            <div>Loading...</div>
        )
    }

    return (
        <UserWrapper>
            <h2>Hello, {user.username}</h2>
            <CardWrapper>
                {renderCards}
            </CardWrapper>
            {errors ? errors.map(err=>(
                <Error key={err}>
                    {err}
                </Error>
            )) : null}
        </UserWrapper>
    )
}