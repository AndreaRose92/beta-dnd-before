
import CharacterCard from "./characters/CharacterCard"
import NewCharacter from "./characters/NewCharacter"
import { NotFound } from "./NotFound"
import { Logout, NavButton } from "./tools/Hooks"

export const UserPage = ({user, characters, deleteCharacter}) => {

    const renderCards = characters.map(character => <CharacterCard key={character.id} character={character} deleteCharacter={deleteCharacter} />)

    if (!user) {
        return <NotFound />
    }

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            {renderCards}<br/>
            <NavButton path={`/users/${user.username}/characters/new`} text={"Create a Character"}><NewCharacter /></NavButton>
            <Logout />
        </div>
    )
}