import { useContext } from "react"
import { Logout, UserContext } from "./tools/Hooks"

export const UserPage = () => {

    const {user} = useContext(UserContext)

    console.log(user)

    return (
        <div>
            <h2>Hello, {user.username}</h2>
            <Logout />
        </div>
    )
}