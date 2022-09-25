
import CharacterCard from "./characters/CharacterCard"
import { NotFound } from "./NotFound"
import { Logout, NavButton } from "./tools/Hooks"

export const UserPage = ({user, userCharacters, deleteCharacter}) => {

    const renderCards = userCharacters.map(character => <CharacterCard key={character.id} character={character} deleteCharacter={deleteCharacter} />)

    if (!user) {
        return <NotFound />
    }

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            {renderCards}<br/>
            <Logout />
        </div>
    )
}