import { useContext } from "react"
import { Logout, UserContext } from "./tools/Hooks"
// import { getRequest } from "./tools/FetchTypes"

export const UserPage = () => {

    const {user} = useContext(UserContext)

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            <Logout />
        </div>
    )
}