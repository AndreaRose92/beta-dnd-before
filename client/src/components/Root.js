import { useContext, useEffect } from "react"
import { getRequest } from "./tools/FetchTypes"
import { NavButton, UserContext } from "./tools/Hooks"

export const Root = () => {

    const {user, setUser} = useContext(UserContext)

    useEffect(()=>{getRequest('/me', setUser)}, [setUser])

    return (
        <div>
            <NavButton path={'login'} text={'login'}/>
            <NavButton path={'signup'} text={'signup'}/>
            {user ? <NavButton path={`${user.username}`} text={"me"}/> : null }
            <NavButton path={'races'} text={"races"}/>
            <NavButton path={'dnd_classes'} text={"classes"}/>
        </div>
    )
}