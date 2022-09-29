import React from "react"
import { NavButton } from "../hookComponents"


export const NotFound = () => {
    return (
        <React.Fragment>
            <h1 style={{"textAlign": "center"}} >You've lost your way, traveller. Head back to the tavern.</h1>
            <h3 style={{"textAlign": "center"}} >404 page not found <br/>
            <NavButton />
            </h3>
        </React.Fragment>
    )
}