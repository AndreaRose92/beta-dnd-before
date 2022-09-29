import { useContext } from "react"
import { UserContext } from "../hookComponents"

export const Root = () => {

    const {user} = useContext(UserContext)

    if (!user) {return (<h2 style={{"textAlign": "center"}} >Sign In!</h2>)}

    return (<h2>{`Good [time of day], ${user.username}`}</h2>)
}