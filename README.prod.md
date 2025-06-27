# MSPR Kafe - Reverse Proxy Gateway

Reverse proxy Nginx pour le projet MSPR Kafe, servant de point d'entrée unique vers toutes les APIs de production.

## 🚀 Déploiement sur Coolify

### Structure du projet
```
nginx-proxy/
├── Dockerfile
├── docker-compose.prod.yml
├── nginx/
│   ├── nginx.conf
│   ├── conf.d/
│   │   └── default.conf
│   └── html/
│       └── index.html
```

### Services proxyfiés
- **Customer API**: https://mspr-kafe-customer-api.wexop.eu
- **Order API**: https://mspr-kafe-order-api.wexop.eu  
- **Product API**: https://mspr-kafe-product-api.wexop.eu
- **RabbitMQ**: http://rabbimq-kawa.wexop.eu
- **Keycloak**: https://kawa-keycloak.wexop.eu

### Routes disponibles
- `/api/customers/*` - Customer API via proxy
- `/api/orders/*` - Order API via proxy
- `/api/products/*` - Product API via proxy
- `/customers/*` - Accès direct Customer API
- `/orders/*` - Accès direct Order API
- `/products/*` - Accès direct Product API
- `/metrics` - Métriques Prometheus
- `/health` - Health check
- `/rabbitmq/` - Interface RabbitMQ
- `/` - Documentation interactive

## 🔧 Configuration

Le reverse proxy est configuré pour :
- Rediriger le trafic vers les services HTTPS de production
- Gérer les en-têtes de proxy
- Fournir une interface web de documentation
- Exposer des endpoints de monitoring

## 📊 Monitoring

- Métriques Prometheus disponibles sur `/metrics`
- Health checks sur `/health`
- Dashboards Grafana intégrés dans l'interface web
