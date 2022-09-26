import React from "react"
import { NavButton } from "../hookComponents/Hooks"


export const NotFound = () => {
    return (
        <React.Fragment>
            <h1>You've lost your way, traveller. Head back to the tavern.</h1>
            <h3>404 page not found</h3>
            <NavButton />
        </React.Fragment>
    )
}