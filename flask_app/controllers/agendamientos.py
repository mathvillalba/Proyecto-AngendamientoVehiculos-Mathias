from flask import render_template,redirect,session,request, flash
from flask_app import app
from flask_app.models.agendamiento import Agendamiento
from flask_app.models.user import User


@app.route('/new/agendamiento')
def new_agendamiento():
    if 'user_id' not in session:
        return redirect('/logout')
    data = {
        "id":session['user_id'],
    }
    return render_template('new_agendamiento.html',user=User.get_by_id(data))


@app.route('/create/agendamiento',methods=['POST'])
def create_agendamiento():
    if 'user_id' not in session:
        return redirect('/logout')
    data = {
        "vehiculo_id": int(request.form["vehiculo_id"]),
        "fecha": request.form["fecha"],
        "motivouso":request.form["motivouso"],
        "user_id": session["user_id"]
    }
    Agendamiento.save(data)
    return redirect('/dashboard')

@app.route('/edit/agendamiento/<int:idagendamiento>')
def edit_agendamiento(idagendamiento):
    if 'user_id' not in session:
        return redirect('/logout')
    data = {
        "idagendamiento":idagendamiento
    }
    user_data = {
        "id":session['user_id']
    }
    return render_template("edit_agendamiento.html",edit=Agendamiento.get_one(data),user=User.get_by_id(user_data))

@app.route('/update/agendamiento',methods=['POST'])
def update_agendamiento():
    if 'user_id' not in session:
        return redirect('/logout')
    if not Agendamiento.validate_agendamiento(request.form):
        data= {
        "idagendamiento": request.form['idagendamiento']
        }
        return render_template('/edit/agendamiento/', edit=Agendamiento.get_one(data))
    data = {
        "fecha": request.form['fecha'],
        "motivouso": request.form['motivouso'],
        "idagendamiento": request.form['idagendamiento']
    }
    Agendamiento.update(data)
    return redirect('/dashboard')

@app.route('/agendamiento/<int:idagendamiento>')
def show_agendamiento(idagendamiento):
    if 'user_id' not in session:
        return redirect('/logout')
    data = {
        "idagendamiento":idagendamiento
    }
    user_data = {
        "id":session['user_id']
    }
    return render_template("show_agendamiento.html",agendamiento=Agendamiento.get_one(data),user=User.get_by_id(user_data))

@app.route('/destroy/agendamiento/<int:idagendamiento>')
def destroy_agendamiento(idagendamiento):
    if 'user_id' not in session:
        return redirect('/logout')
    data = {
        "idagendamiento":idagendamiento
    }
    Agendamiento.destroy(data)
    return redirect('/dashboard')
