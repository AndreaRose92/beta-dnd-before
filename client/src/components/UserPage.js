
import CharacterCard from "./characters/CharacterCard"
import NewCharacter from "./characters/NewCharacter"
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
            <NavButton path={`/test/new_character/basic`} text={"Create a Character"}><NewCharacter /></NavButton>
            <Logout />
        </div>
    )
}