import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import { postRequest } from "../tools/FetchTypes"
import { UserContext } from "../tools/Hooks"

export const Signup = () => {

    const navigate = useNavigate()
    const { setUser } = useContext(UserContext)

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('') 
    const [passwordConfirmation, setPasswordConfirmation] = useState('')

    const onSignup = e => {
        e.preventDefault()
        postRequest('/signup', {username, password, password_confirmation: passwordConfirmation}, setUser)
        navigate(`/`)
    }

    return (
        <div>
            <form onSubmit={onSignup}>
                <input type='text' placeholder="username" onChange={e=>setUsername(e.target.value)} /><br/>
                <input type='password' placeholder="password" onChange={e=>setPassword(e.target.value)} /><br/>
                <input type='password' placeholder="password confirmation" onChange={e=>setPasswordConfirmation(e.target.value)} /><br/>
                <button type='submit'>Submit</button>
            </form>
        </div>
    )

}