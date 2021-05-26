<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h4><strong>Administración:. Usuarios</strong></h4>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Administración</a></li>
            <li class="breadcrumb-item active">Usuarios</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <section class="content">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Módulo Usuarios &nbsp;<i class="fas fa-users-cog"></i></h3>
      </div>
      <div class="card-body">
        <button type="btn" class="btn btn-secondary" data-toggle="modal" data-target="#modal-registrar-usuario"><i class="fas fa-user-plus"></i> Registrar Usuario
        </button>
      </div>
      <div class="card-body">
        <table id="datatableUsuarios" class="table table-bordered table-hover dt-responsive datatableUsuarios">
          <thead>
            <tr>
              <th style="width: 10px">#</th>
              <th>DNI N°</th>
              <th>Nombres</th>
              <th>Apellidos</th>
              <th>Perfil</th>
              <th>Correo</th>
              <th>Cuenta</th>
              <th>Fecha de Alta</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </section>
</div>