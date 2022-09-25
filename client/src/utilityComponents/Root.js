import { useContext } from "react"
import { UserContext } from "../hookComponents/Hooks"

export const Root = () => {

    const {user} = useContext(UserContext)

    if (!user) {
        return (
            <div>
                <h2>Sign In!</h2>
            </div>
        )
    }

    return (
        <div>
            <h2>{`Good [time of day], ${user.username}`}</h2>
        </div>
    )
}