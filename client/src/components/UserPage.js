import { useContext } from "react"
import { Logout, NavButton, UserContext } from "./tools/Hooks"
// import { getRequest } from "./tools/FetchTypes"

export const UserPage = () => {

    const {user} = useContext(UserContext)

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            <NavButton path={`/users/${user.username}/characters/new`} text={"Create a Character"} />
            <Logout />
        </div>
    )
}