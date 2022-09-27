
import { Logout, NavButton } from "../hookComponents"
import { CharacterCard } from "../characterComponents"
import { NotFound } from "./"


export const UserPage = ({user, userCharacters, deleteCharacter}) => {

    const renderCards = userCharacters.map(character => <CharacterCard key={character.id} character={character} deleteCharacter={deleteCharacter} />)

    if (!user) {
        return <NotFound />
    }

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            {renderCards}<br/>
            <NavButton path={'/new_character/basic'} text={'create a character'}/>
            <Logout />
        </div>
    )
}