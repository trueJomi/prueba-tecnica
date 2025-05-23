import { useEffect, useState } from "react";
import { getUsers } from "./services/user.service";
import type { User } from "./models/User.model";

function App() {
  const [users, setUsers] = useState<User[]>();

  useEffect(() => {
    getUsers().then((data) => {
      setUsers(data);
    })
  },[])
  return (
    <div className="p-10" >
      <h1 className=" text-3xl text-center mb-5 font-bold" >
        Lista de 10 usuarios 
      </h1>

      <main>
        {users!==undefined
          ? <div className=" grid grid-cols-1 gap-5 md:grid-cols-2" >
              {users.map((user) => (
                <div key={user.nombre} className="p-5 bg-gray-200 text-gray-900 flex gap-5" >
                  <img src={user.img} alt={user.nombre} />
                  <div>
                    <h2 className="font-black text-lg" >{user.nombre}</h2>
                    <p className=" uppercase" >{user.genero}</p>
                    <p>{new Date(user.fecha_nacimiento).toLocaleDateString("es-PE", {
                      year: "numeric",
                      month: "long",
                      day: "numeric"
                    })}</p>
                    <p>{user.ubicacion}</p>
                    <p>{user.email}</p>
                  </div>
                </div>
              ))}
          </div>
          : <p>Cargando...</p>
        }
      </main>
    </div>
  )
}

export default App
