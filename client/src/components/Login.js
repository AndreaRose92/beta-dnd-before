import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import { postRequest } from "./tools/FetchTypes"
import { UserContext } from "./tools/Hooks"

export const Login = () => {

    const navigate = useNavigate()
    const {setUser} = useContext(UserContext)

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')

    const onLogin = e => {
        e.preventDefault()
        postRequest('/login', {username, password}, setUser)
        navigate(`/`)
    }

    return (
        <div>
            <form onSubmit={onLogin}>
                <input type='text' placeholder="username" onChange={e=>setUsername(e.target.value)} /><br/>
                <input type='password' placeholder="password" onChange={e=>setPassword(e.target.value)} /><br/>
                <button type='submit'>Submit</button>
            </form>
        </div>
    )

}