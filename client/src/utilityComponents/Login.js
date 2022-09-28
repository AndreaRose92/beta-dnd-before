import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import { ErrorContext, UserContext } from "../hookComponents"
import { Error } from '../styles'


export const Login = () => {

    const navigate = useNavigate()
    const {user, setUser} = useContext(UserContext)
    const {errors, setErrors} = useContext(ErrorContext)

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')

    const onLogin = e => {
        e.preventDefault()
        fetch('/login', {
            method: "POST",
            headers: {"Contenet-Type": "application/json"},
            body: JSON.stringify({username, password})
        }).then(r=>{
            if (r.ok) {
                r.json().then(me=>setUser(me)).then(()=>navigate(`/users/${user.username}`))
            } else {
                r.json().then(errors=>setErrors(errors))
            }
        })
    }

    return (
        <div>
            <form onSubmit={onLogin}>
                <input type='text' placeholder="username" onChange={e=>setUsername(e.target.value)} /><br/>
                <input type='password' placeholder="password" onChange={e=>setPassword(e.target.value)} /><br/>
                <button type='submit'>Submit</button>
                {errors.map(err=>(
                    <Error key={err}>
                        {err}
                    </Error>
                ))}
            </form>
        </div>
    )

}