# API – Fonctionnalité des Favoris

## Authentification

### POST /api/v1/login
Body:
{
  "email": "test@example.com",
  "password": "123456"
}

→ Réponse : token JWT

---

## Favoris

### POST /api/v1/favorites
Headers: Authorization: Bearer <TOKEN>
Body:
{
  "quote_id": 1
}

### GET /api/v1/favorites
Headers: Authorization: Bearer <TOKEN>

### DELETE /api/v1/favorites/:id
Headers: Authorization: Bearer <TOKEN>

# ✅ TEST - Enregistrement d’un utilisateur via /api/v1/register

## 🔧 Requête POST

**URL** :  
`http://localhost:3000/api/v1/register`

**Méthode** : POST  
**Headers** :  

## POST /api/v1/register

**Body (JSON)** :
```json
{
  "email": "test@quotety.com",
  "username": "testuser",
  "password": "123456",
  "password_confirmation": "123456"
}

