import { useContext } from "react"
// import { getRequest } from "./tools/FetchTypes"
import { Logout, NavButton, UserContext } from "./tools/Hooks"

export const Root = () => {

    const {user} = useContext(UserContext)

    if (user === null) {
        return (
            <div>
                <NavButton path={'login'} text={'login'}/>
                <NavButton path={'signup'} text={'signup'}/>
                <NavButton path={'races'} text={"races"}/>
                <NavButton path={'dnd_classes'} text={"classes"}/>
            </div>
        )
    } else {
        return (
            <div>
                <NavButton path={`/users/${user.username}`} text={"me"}/>
                <Logout />
                <NavButton path={'races'} text={"races"}/>
                <NavButton path={'dnd_classes'} text={"classes"}/>
            </div>
        )
    }
}