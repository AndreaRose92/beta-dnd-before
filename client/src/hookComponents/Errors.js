import React, { useState } from "react"

export const ErrorContext = React.createContext()

export const ErrorProvider = ({children}) => {
    const [errors, setErrors] = useState(null)
    return (
        <ErrorContext.Provider value ={{errors, setErrors}}>
            {children}
        </ErrorContext.Provider>
    )
}