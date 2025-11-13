# Ecommerce API Implementation TODO

## API Endpoints Implemented

### Auth Endpoints
- [x] `/api/auth/register` - POST - Register new user - No Auth Required
- [x] `/api/auth/login` - POST - Login - No Auth Required
- [x] `/api/auth/me` - GET - Get current user - Auth Required

### Product Endpoints
- [x] `/api/products` - GET - Get all products - No Auth Required
- [x] `/api/products/:id` - GET - Get single product - No Auth Required
- [x] `/api/products` - POST - Create product - Admin only
- [x] `/api/products/:id` - PUT - Update product - Admin only
- [x] `/api/products/:id` - DELETE - Delete product - Admin only

### Cart Endpoints
- [x] `/api/cart` - POST - Add to cart - Auth Required
- [x] `/api/cart` - GET - View cart - Auth Required

### Order Endpoints
- [x] `/api/orders` - POST - Create order - Auth Required
- [x] `/api/orders/:id` - GET - Get order details - Auth Required
- [x] `/api/orders/user/:id` - GET - User order history - Auth Required

## Implementation Details Completed
- [x] Add HTTP dependency to pubspec.yaml
- [x] Create base API service class with authentication headers
- [x] Create storage service for token management
- [x] Implement auth services (register, login, getMe, logout)
- [x] Create product model
- [x] Implement product services (getAll, getById, create, update, delete)
- [x] Create cart model
- [x] Implement cart services (add, get, update, remove, clear)
- [x] Implement order services (create, getById, getUserOrders)
- [x] Update auth provider to use API services
- [x] Update product provider to use API services
- [x] Update cart provider to use API services
- [x] Update order provider to use API services
- [x] Fix import conflicts in providers

## Remaining Tasks
- [ ] Update screens to call provider methods instead of direct data access
- [ ] Handle API errors in UI
- [ ] Add loading states to screens
- [ ] Test API integration
- [x] Update base URL in api_services.dart to match backend (using dummyjson.com)
