# ApexToWWW — Backlink Submission Drafts

Drafts for manual posting. **Nothing here has been posted.** Claims were fact-checked
on 2026-10-30; two were wrong in the first version and have been corrected:

- ~~"No tracking"~~ — the website runs Google Analytics (GA4), so it is not tracking-free. Removed.
- ~~"<50ms redirect latency"~~ — measured 90-200 ms end to end from Denmark (TLS handshake
  included). Server-side time is not measured, so the drafts now quote the end-to-end figure.

Posting notes:
- Post to **one** subreddit at a time, days apart. Identical text in three subs in one day
  reads as spam and risks the account. Rewrite the body per community and answer comments.
- Hacker News: the first comment matters more than the title; be there to answer questions.
- Lists/PRs (free-for-dev etc.) have contribution rules; read them before opening a PR.
- Link equity from most of these is nofollow. The value is discovery and traffic, plus
  a few crawl paths for Google. Do not expect ranking jumps from any single post.

---

## 1. Hacker News — Show HN

**URL:** https://news.ycombinator.com/submit

**Title:**
```
Show HN: ApexToWWW – Free apex/naked domain to www redirect via DNS
```

**URL field:** `https://www.apextowww.com`

**First comment (post immediately after submission):**
```
Hey HN! I built ApexToWWW because I kept running into the same
problem: hosting providers like GitHub Pages, Netlify, and Vercel
need a CNAME for custom domains, but you can't set a CNAME on
an apex domain (RFC 1034).

The usual options are:
- Pay $5-20/mo for a redirect service
- Use Cloudflare (requires moving your nameservers)
- Set up your own server just for a redirect

ApexToWWW is a free alternative. You point your apex domain's
A and AAAA records to our server, and we respond with a 301 to
your www subdomain. That's it.

Technical details:
- 301 permanent redirect with full path/query preservation
- Auto SSL via Let's Encrypt
- IPv4 + IPv6 dual stack
- HTTP/3 (QUIC)
- ~100 ms end to end, TLS handshake included (measured from Denmark)
- ARM64 infrastructure (Hetzner)
- No account, no signup

The service has been running reliably for a few months now.
Happy to answer any questions about the architecture or DNS
edge cases.
```

---

## 2. Reddit Posts

### r/webdev

**Title:** `I built a free service to redirect apex/naked domains to www — no signup needed`

**Body:**
```
I kept running into the same problem: you want to use GitHub
Pages or Netlify with a custom domain, but your apex domain
(example.com without www) needs a CNAME — which DNS doesn't
allow at the root.

So I built ApexToWWW — a free DNS redirect service. You add
two DNS records (A + AAAA) and your naked domain automatically
redirects to www with a 301.

Features:
- Automatic SSL (Let's Encrypt)
- IPv6 support
- HTTP/3
- Path + query string preservation
- No account needed

It's been running for a few months. A redirect takes ~100 ms end
to end, TLS handshake included.

Site: https://www.apextowww.com

Would love feedback from the community. What would make this
more useful for your workflow?
```

### r/selfhosted

**Title:** `Free apex domain → www redirect service (alternative to self-hosting nginx just for a 301)`

**Body:**
```
If you've ever set up an nginx/caddy instance just to redirect
example.com to www.example.com... I feel your pain.

I built ApexToWWW — point your apex domain's A/AAAA records to
our server and get a free 301 redirect to www. Auto SSL, IPv6,
HTTP/3, path preservation.

Why not self-host the redirect? You totally can. But if you're
using a platform like GitHub Pages, Netlify, or Vercel that
requires CNAME, this saves you from running infrastructure just
for a redirect.

DNS records:
- A: 65.21.184.101
- AAAA: 2a01:4f9:c012:a304::1

No signup, no cost. Running on ARM64 (Hetzner).

https://www.apextowww.com

Open to feedback!
```

### r/sysadmin

**Title:** `Free tool for the "apex domain can't CNAME" problem`

**Body:**
```
Quick share for anyone dealing with the classic DNS limitation
where you can't CNAME an apex/root domain.

Built a free redirect service called ApexToWWW. Point your apex
A/AAAA records to our servers, and we return a 301 to your www
subdomain. Handles SSL automatically via Let's Encrypt.

Useful when migrating to platforms that need CNAME (most CDNs,
GitHub Pages, Netlify, etc.) but users/bookmarks still hit the
naked domain.

Technical details:
- 301 with full path/query preservation
- Dual-stack IPv4/IPv6
- HTTP/3 support
- ~100 ms end to end (TLS included)
- No account or signup needed

https://www.apextowww.com

Been running stable for a few months. Happy to answer questions
about reliability or architecture.
```

---

## 3. alternativeTo.net

**URL:** https://alternativeto.net/manage/new-app/

**Fields:**
- Name: `ApexToWWW`
- URL: `https://www.apextowww.com`
- Description: `Free DNS apex domain (root/naked domain) to www subdomain redirect service. Automatic SSL, IPv6, HTTP/3 support. No account needed — just add two DNS records.`
- Category: DNS / Web Hosting / Domain Management
- Tags: `dns`, `redirect`, `domain`, `free`, `apex-domain`, `naked-domain`, `301-redirect`
- License: Free
- Platforms: Web
- Alternative to: Redirect.pizza, EasyRedir, Redirection.io

---

## 4. Product Hunt

**URL:** https://www.producthunt.com/posts/new

**Tagline:** `Free apex domain to www redirect — just two DNS records`

**Description:**
```
ApexToWWW redirects your naked domain (example.com) to www
(www.example.com) for free. No signup, no config files — just
add two DNS records and it works.

Built for developers who use GitHub Pages, Netlify, Vercel, or
any hosting that requires a CNAME. Since you can't CNAME an
apex domain, you need a redirect. That's what we do.

- Automatic SSL via Let's Encrypt
- IPv6 + HTTP/3 support
- ~100 ms redirects, TLS included
- Full path and query preservation
- 100% free, no account needed
```

**Topics:** Developer Tools, DNS, Web Hosting
**Thumbnail:** Use og-image.png or favicon

---

## 5. GitHub — free-for-dev

**Repo:** https://github.com/ripienaar/free-for-dev

**Section:** DNS (or Web Hosting)

**PR entry to add:**
```markdown
  * [ApexToWWW](https://www.apextowww.com) — Free DNS apex/root/naked domain to www subdomain 301 redirect service. Automatic SSL, IPv6, HTTP/3. No account needed.
```

**How to submit:** Fork repo, edit README.md, add entry in alphabetical order under the DNS section, open PR.

---

## 6. GitHub — awesome-selfhosted

**Repo:** https://github.com/awesome-selfhosted/awesome-selfhosted

**Note:** This list is for self-hosted software. ApexToWWW is a hosted service, so it may not qualify unless the code is open-sourced. Consider open-sourcing the redirect server first.

---

## 7. Other Lists to Submit To

- **free-for.dev** (https://free-for.dev) — same as free-for-dev above
- **awesome-free** lists on GitHub — search for relevant ones
- **dev.to** — write a "How I built..." article with link back
- **IndieHackers** (https://www.indiehackers.com) — post in products
- **StackOverflow** — answer questions about apex domain redirects and mention ApexToWWW where relevant
- **dev-resources** (https://github.com/marcelscruz/dev-resources) — submit PR

---

## Submission Checklist

- [ ] Hacker News (Show HN)
- [ ] Reddit r/webdev
- [ ] Reddit r/selfhosted
- [ ] Reddit r/sysadmin
- [ ] alternativeTo.net
- [ ] Product Hunt
- [ ] GitHub PR: free-for-dev
- [ ] IndieHackers product page
- [ ] dev.to article
- [ ] StackOverflow answers (organic, over time)
